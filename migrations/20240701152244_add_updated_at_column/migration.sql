/*
  Warnings:

  - You are about to drop the column `platformId` on the `Portfolio` table. All the data in the column will be lost.
  - You are about to drop the column `skillId` on the `Portfolio` table. All the data in the column will be lost.
  - You are about to drop the column `tagId` on the `Portfolio` table. All the data in the column will be lost.
  - You are about to drop the column `toolId` on the `Portfolio` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Portfolio` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Portfolio" DROP CONSTRAINT "Portfolio_platformId_fkey";

-- DropForeignKey
ALTER TABLE "Portfolio" DROP CONSTRAINT "Portfolio_skillId_fkey";

-- DropForeignKey
ALTER TABLE "Portfolio" DROP CONSTRAINT "Portfolio_tagId_fkey";

-- DropForeignKey
ALTER TABLE "Portfolio" DROP CONSTRAINT "Portfolio_toolId_fkey";

-- AlterTable
ALTER TABLE "Portfolio" DROP COLUMN "platformId",
DROP COLUMN "skillId",
DROP COLUMN "tagId",
DROP COLUMN "toolId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "imageGallery" TEXT[],
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "descriptions" DROP NOT NULL;

-- CreateTable
CREATE TABLE "_PortfolioTools" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioSkills" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioTags" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioPlatforms" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioTools_AB_unique" ON "_PortfolioTools"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioTools_B_index" ON "_PortfolioTools"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioSkills_AB_unique" ON "_PortfolioSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioSkills_B_index" ON "_PortfolioSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioTags_AB_unique" ON "_PortfolioTags"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioTags_B_index" ON "_PortfolioTags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioPlatforms_AB_unique" ON "_PortfolioPlatforms"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioPlatforms_B_index" ON "_PortfolioPlatforms"("B");

-- AddForeignKey
ALTER TABLE "_PortfolioTools" ADD CONSTRAINT "_PortfolioTools_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioTools" ADD CONSTRAINT "_PortfolioTools_B_fkey" FOREIGN KEY ("B") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioSkills" ADD CONSTRAINT "_PortfolioSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioSkills" ADD CONSTRAINT "_PortfolioSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioTags" ADD CONSTRAINT "_PortfolioTags_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioTags" ADD CONSTRAINT "_PortfolioTags_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioPlatforms" ADD CONSTRAINT "_PortfolioPlatforms_A_fkey" FOREIGN KEY ("A") REFERENCES "Platform"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioPlatforms" ADD CONSTRAINT "_PortfolioPlatforms_B_fkey" FOREIGN KEY ("B") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;
