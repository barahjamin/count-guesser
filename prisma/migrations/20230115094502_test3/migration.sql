/*
  Warnings:

  - The primary key for the `DailyGame` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DailyGame" (
    "date" TEXT NOT NULL PRIMARY KEY,
    "imageId" INTEGER NOT NULL,
    CONSTRAINT "DailyGame_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DailyGame" ("date", "imageId") SELECT "date", "imageId" FROM "DailyGame";
DROP TABLE "DailyGame";
ALTER TABLE "new_DailyGame" RENAME TO "DailyGame";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
