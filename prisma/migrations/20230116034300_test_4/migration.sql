/*
  Warnings:

  - You are about to drop the `ImageCount` table. If the table is not empty, all the data it contains will be lost.

*/

-- DropTable
PRAGMA foreign_keys=off;

-- CreateTable
CREATE TABLE "ImageCountInstance" (
    "imageId" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "difficulty" INTEGER NOT NULL,

    PRIMARY KEY ("imageId", "label"),
    CONSTRAINT "ImageCountInstance_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

insert into "ImageCountInstance" select * from "ImageCount";

DROP TABLE "ImageCount";
PRAGMA foreign_keys=on;
