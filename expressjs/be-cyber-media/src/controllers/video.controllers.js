import videoService from "../services/video.services.js";

const videoController = {
  listVideo: async (req, res, n) => {
    const result = await videoService.listVideo(req);
    const resData = {
      status: `success`,
      code: 200,
      message: `Lấy danh sách video thành công`,
      metaData: result
    }
    res.status(resData.code).json(resData);
  },
  videoType: async (req, res, next) => {
    videoService.videoType;
    res.json(result);
  },
};

export default videoController;
