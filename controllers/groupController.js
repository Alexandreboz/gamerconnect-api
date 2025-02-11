const db = require("../firebaseConfig");

exports.createGroup = async (req, res) => {
  try {
    const { nom_groupe, description } = req.body;
    const newGroupRef = await db.collection("Groupes").add({
      nom_groupe,
      description,
      date_creation: new Date(),
    });
    res.status(201).json({ id: newGroupRef.id });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getGroups = async (req, res) => {
  try {
    const snapshot = await db.collection("Groupes").get();
    const groups = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    res.json(groups);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};