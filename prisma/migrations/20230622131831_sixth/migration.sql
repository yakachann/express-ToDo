/*
  Warnings:

  - You are about to drop the column `userName` on the `ToDoData` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ToDoData" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content" TEXT NOT NULL,
    "time" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isFinished" BOOLEAN NOT NULL DEFAULT false
);
INSERT INTO "new_ToDoData" ("content", "id", "isFinished", "time") SELECT "content", "id", "isFinished", "time" FROM "ToDoData";
DROP TABLE "ToDoData";
ALTER TABLE "new_ToDoData" RENAME TO "ToDoData";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
