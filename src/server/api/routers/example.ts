import { TRPCError } from "@trpc/server";
import { z } from "zod";

import { createTRPCRouter, publicProcedure } from "../trpc";

export const exampleRouter = createTRPCRouter({
  hello: publicProcedure
    .input(z.object({ text: z.string() }))
    .query(({ input }) => {
      return {
        greeting: `Hello ${input.text}`,
      };
    }),
  getAll: publicProcedure.query(({ ctx }) => {
    return ctx.prisma.example.findMany();
  }),
  getAllImages: publicProcedure.query(({ ctx }) => {
    const temp = ctx.prisma.dailyGame.findMany();
    console.log(temp.then((data) => console.log(data)));
    return temp;
  }),
  getDailyImage: publicProcedure
    .input(z.object({ dayOfInterest: z.string() }))
    .query(async ({ input, ctx }) => {
      const { dayOfInterest } = input;

      const dailyGame = await ctx.prisma.dailyGame.findUnique({
        where: {
          date: dayOfInterest,
        },
      });

      if (dailyGame === null) {
        throw new TRPCError({
          message: "That day is not found",
          code: "NOT_FOUND",
        });
      }

      const [image, imageCountInstances] = await ctx.prisma.$transaction([
        ctx.prisma.image.findUnique({ where: { id: dailyGame.imageId } }),
        ctx.prisma.imageCountInstance.findMany({
          where: { imageId: dailyGame.imageId },
        }),
      ]);

      if (image === null) {
        throw new TRPCError({
          message: `Image could not be found for day ${dayOfInterest}`,
          code: "NOT_FOUND",
        });
      }

      return {
        image,
        imageCountInstances,
      };
    }),
});
