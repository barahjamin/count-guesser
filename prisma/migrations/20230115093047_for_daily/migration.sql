-- CreateTable
CREATE TABLE "DailyGame" (
    "date" DATETIME NOT NULL PRIMARY KEY,
    "imageId" INTEGER NOT NULL,
    CONSTRAINT "DailyGame_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
