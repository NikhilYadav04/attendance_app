require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const { router } = require("./routes/userRoutes.js");
const { companyRouter } = require("./routes/companyRoutes.js");
const { locationRouter } = require("./routes/locationRoute.js");
const { employeeRouter } = require("./routes/employeeRoute.js");
const { attendanceRouter } = require("./routes/attendanceRoutes.js");
const { router1 } = require("./route_config/server.js");
const { leaveRouter } = require("./routes/leaveRoute.js");

const corsOptions = {
  origin: "*",
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type", "Authorization"],
  credentials: true,
};

// ["http://example.com", "http://localhost:2000","http://192.168.56.1:2000"]

const app = express();

app.use(cors(corsOptions));

const PORT = process.env.PORT || 2000;
const DB = process.env.DB;
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.get("/", async (req, res) => {
  return res.send("Hello Nikhil");
});

app.use(express.json());
app.use(router1);

router1.use("/api", router);
router1.use("/company", companyRouter);
router1.use("/location", locationRouter);
router1.use("/employee", employeeRouter);
router1.use("/attendance", attendanceRouter);
router1.use("/leave", leaveRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected To Mongoose");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`Server Connected At ${PORT}`);
});
