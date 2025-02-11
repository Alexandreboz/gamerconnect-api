app.use("/api/users", userRoutes);
app.use("/api/events", eventRoutes);
app.use("/api/messages", messageRoutes);
app.use("/api/groups", groupRoutes);
 
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Serveur démarré sur le port ${PORT}`));

const express = require("express");
const { createUser, getUsers } = require("../controllers/userController");

const router = express.Router();
router.post("/", createUser);
router.get("/", getUsers);
module.exports = router;