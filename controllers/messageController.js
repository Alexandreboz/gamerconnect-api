const db = require("../firebaseConfig");

exports.createMessage = async (req, res) => {
  try {
    const { id_envoyeur, id_recepteur, contenu } = req.body;
    const newMessageRef = await db.collection("Messages").add({
      id_envoyeur,
      id_recepteur,
      contenu,
      date_envoi: new Date(),
    });
    res.status(201).json({ id: newMessageRef.id });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getMessages = async (req, res) => {
  try {
    const snapshot = await db.collection("Messages").get();
    const messages = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    res.json(messages);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};