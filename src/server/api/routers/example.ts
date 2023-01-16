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
});
