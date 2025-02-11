const db = require("../firebaseConfig");

exports.createEvent = async (req, res) => {
  try {
    const { nom_evenement, description, date_evenement, id_organisateur } = req.body;
    const newEventRef = await db.collection("Événements").add({
      nom_evenement,
      description,
      date_evenement,
      id_organisateur,
    });
    res.status(201).json({ id: newEventRef.id });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getEvents = async (req, res) => {
  try {
    const snapshot = await db.collection("Événements").get();
    const events = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    res.json(events);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};