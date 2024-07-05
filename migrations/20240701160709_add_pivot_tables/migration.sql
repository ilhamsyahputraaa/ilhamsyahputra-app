/*
  Warnings:

  - You are about to drop the `PortfolioPlatform` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PortfolioSkill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PortfolioTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PortfolioTool` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PortfolioPlatform" DROP CONSTRAINT "PortfolioPlatform_platformId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioPlatform" DROP CONSTRAINT "PortfolioPlatform_portfolioId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioSkill" DROP CONSTRAINT "PortfolioSkill_portfolioId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioSkill" DROP CONSTRAINT "PortfolioSkill_skillId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioTag" DROP CONSTRAINT "PortfolioTag_portfolioId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioTag" DROP CONSTRAINT "PortfolioTag_tagId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioTool" DROP CONSTRAINT "PortfolioTool_portfolioId_fkey";

-- DropForeignKey
ALTER TABLE "PortfolioTool" DROP CONSTRAINT "PortfolioTool_toolId_fkey";

-- DropTable
DROP TABLE "PortfolioPlatform";

-- DropTable
DROP TABLE "PortfolioSkill";

-- DropTable
DROP TABLE "PortfolioTag";

-- DropTable
DROP TABLE "PortfolioTool";

-- CreateTable
CREATE TABLE "_PortfolioToTool" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioToSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PlatformToPortfolio" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioToTool_AB_unique" ON "_PortfolioToTool"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioToTool_B_index" ON "_PortfolioToTool"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioToSkill_AB_unique" ON "_PortfolioToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioToSkill_B_index" ON "_PortfolioToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioToTag_AB_unique" ON "_PortfolioToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioToTag_B_index" ON "_PortfolioToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PlatformToPortfolio_AB_unique" ON "_PlatformToPortfolio"("A", "B");

-- CreateIndex
CREATE INDEX "_PlatformToPortfolio_B_index" ON "_PlatformToPortfolio"("B");

-- AddForeignKey
ALTER TABLE "_PortfolioToTool" ADD CONSTRAINT "_PortfolioToTool_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToTool" ADD CONSTRAINT "_PortfolioToTool_B_fkey" FOREIGN KEY ("B") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToSkill" ADD CONSTRAINT "_PortfolioToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToSkill" ADD CONSTRAINT "_PortfolioToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToTag" ADD CONSTRAINT "_PortfolioToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToTag" ADD CONSTRAINT "_PortfolioToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PlatformToPortfolio" ADD CONSTRAINT "_PlatformToPortfolio_A_fkey" FOREIGN KEY ("A") REFERENCES "Platform"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PlatformToPortfolio" ADD CONSTRAINT "_PlatformToPortfolio_B_fkey" FOREIGN KEY ("B") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;
