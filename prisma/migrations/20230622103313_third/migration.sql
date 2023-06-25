/*
  Warnings:

  - You are about to drop the column `createdAt` on the `ToDoData` table. All the data in the column will be lost.
  - You are about to drop the column `registeredUser` on the `ToDoData` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `ToDoData` table. All the data in the column will be lost.
  - You are about to drop the column `updatedUser` on the `ToDoData` table. All the data in the column will be lost.
  - Added the required column `userName` to the `ToDoData` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ToDoData" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "time" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isFinished" BOOLEAN NOT NULL DEFAULT false
);
INSERT INTO "new_ToDoData" ("content", "id", "isFinished") SELECT "content", "id", "isFinished" FROM "ToDoData";
DROP TABLE "ToDoData";
ALTER TABLE "new_ToDoData" RENAME TO "ToDoData";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
