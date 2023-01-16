-- CreateTable
CREATE TABLE "Example" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "url" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ImageCount" (
    "imageId" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "difficulty" INTEGER NOT NULL,

    PRIMARY KEY ("imageId", "label"),
    CONSTRAINT "ImageCount_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Image_url_key" ON "Image"("url");
