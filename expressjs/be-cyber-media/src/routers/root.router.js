import express from "express"

const rootRouter = express.Router()

// rootRouter.use("/video", videoRouter)
// rootRouter.use("/auth", authRouter)

rootRouter.get(`/`, (request, respone, next) => {
    respone.json(`ok`);
 });

export default rootRouter