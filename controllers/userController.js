const db = require("../firebaseConfig");
const User = require("../models/userModel");

exports.createUser = async (req, res) => {
  try {
    const { nom, prenom, email, plateformes } = req.body;
    const newUserRef = await db.collection("Utilisateurs").add({
      nom,
      prenom,
      email,
      date_inscription: new Date(),
      plateformes,
    });
    res.status(201).json({ id: newUserRef.id });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getUsers = async (req, res) => {
  try {
    const snapshot = await db.collection("Utilisateurs").get();
    const users = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};