import express from "express";
import videoController from "../controllers/video.controllers.js";

const videoRouter = express.Router();

videoRouter.get(`/video-list`, videoController.listVideo);

videoRouter.get(`/video-type`, videoController.videoType);

videoRouter.post(`/login`, () => {});

export default videoRouter;
