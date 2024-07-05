/*
  Warnings:

  - You are about to drop the `_PortfolioPlatforms` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PortfolioSkills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PortfolioTags` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PortfolioTools` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `createdAt` on table `Portfolio` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updatedAt` on table `Portfolio` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "_PortfolioPlatforms" DROP CONSTRAINT "_PortfolioPlatforms_A_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioPlatforms" DROP CONSTRAINT "_PortfolioPlatforms_B_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioSkills" DROP CONSTRAINT "_PortfolioSkills_A_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioSkills" DROP CONSTRAINT "_PortfolioSkills_B_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioTags" DROP CONSTRAINT "_PortfolioTags_A_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioTags" DROP CONSTRAINT "_PortfolioTags_B_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioTools" DROP CONSTRAINT "_PortfolioTools_A_fkey";

-- DropForeignKey
ALTER TABLE "_PortfolioTools" DROP CONSTRAINT "_PortfolioTools_B_fkey";

-- AlterTable
ALTER TABLE "Portfolio" ALTER COLUMN "createdAt" SET NOT NULL,
ALTER COLUMN "updatedAt" SET NOT NULL;

-- DropTable
DROP TABLE "_PortfolioPlatforms";

-- DropTable
DROP TABLE "_PortfolioSkills";

-- DropTable
DROP TABLE "_PortfolioTags";

-- DropTable
DROP TABLE "_PortfolioTools";

-- CreateTable
CREATE TABLE "PortfolioTool" (
    "portfolioId" INTEGER NOT NULL,
    "toolId" INTEGER NOT NULL,

    CONSTRAINT "PortfolioTool_pkey" PRIMARY KEY ("portfolioId","toolId")
);

-- CreateTable
CREATE TABLE "PortfolioPlatform" (
    "portfolioId" INTEGER NOT NULL,
    "platformId" INTEGER NOT NULL,

    CONSTRAINT "PortfolioPlatform_pkey" PRIMARY KEY ("portfolioId","platformId")
);

-- CreateTable
CREATE TABLE "PortfolioSkill" (
    "portfolioId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,

    CONSTRAINT "PortfolioSkill_pkey" PRIMARY KEY ("portfolioId","skillId")
);

-- CreateTable
CREATE TABLE "PortfolioTag" (
    "portfolioId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,

    CONSTRAINT "PortfolioTag_pkey" PRIMARY KEY ("portfolioId","tagId")
);

-- AddForeignKey
ALTER TABLE "PortfolioTool" ADD CONSTRAINT "PortfolioTool_portfolioId_fkey" FOREIGN KEY ("portfolioId") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioTool" ADD CONSTRAINT "PortfolioTool_toolId_fkey" FOREIGN KEY ("toolId") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioPlatform" ADD CONSTRAINT "PortfolioPlatform_portfolioId_fkey" FOREIGN KEY ("portfolioId") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioPlatform" ADD CONSTRAINT "PortfolioPlatform_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioSkill" ADD CONSTRAINT "PortfolioSkill_portfolioId_fkey" FOREIGN KEY ("portfolioId") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioSkill" ADD CONSTRAINT "PortfolioSkill_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioTag" ADD CONSTRAINT "PortfolioTag_portfolioId_fkey" FOREIGN KEY ("portfolioId") REFERENCES "Portfolio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortfolioTag" ADD CONSTRAINT "PortfolioTag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
