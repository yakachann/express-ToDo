const router = require('express').Router();
const { PrismaClient } = require('@prisma/client');
const bodyParser = require('body-parser');
const prisma = new PrismaClient();

//ejsの利用
const express = require('express');
const app = express();
app.set('view engine', 'ejs');

//bodyParserの利用
app.use(bodyParser.urlencoded({ extended: true }));




/**
 * 一覧表示
 */
router.get('/contents', async (req, res, next) => {
  try {
    // res.render("../views/top.ejs");
    const contents = await prisma.toDoData.findMany({});
    // const data = contents.
    //res.json(contents);
    //res.render("../views/top.ejs", { id : contents[0].id, content : contents[0].content });
    res.render("../views/top.ejs", { contents: contents });


  } catch (error) {
    next(error);
  }
});

/**
 * 新しいタスクの作成
 */
router.post('/contents', async (req, res, next) => {
  try {
    const contents = await prisma.toDoData.create({
      data: {
        content: req.body.addTask
      },
    })
    res.redirect('/api/contents');


  } catch (error) {
    next(error);
  }
});

/**
 * タスクの削除
 */
router.post('/contents/:id', async (req, res, next) => {
  try {
    const { id } = req.params;
    console.log(id);
    const deletedContents = await prisma.toDoData.delete({
      where: {
        id: Number(id),
      }
    })
    res.redirect('/api/contents');
  } catch (error) {
    next(error);
  }
});

/**
 * タスクの更新
 */
router.post('/contents/update/:id', async (req, res, next) => {
  try {
    const { id } = req.params
    const contents = await prisma.toDoData.update({
      where: {
        id: Number(id),
      },
      data: {
        content: req.body.editTask
      }
    })
    // res.json(contents);
    res.redirect('/api/contents');
  } catch (error) {
    next(error);
  }
});

module.exports = router;
