class Event {
    constructor(id, nom_evenement, description, date_evenement, id_organisateur) {
      this.id = id;
      this.nom_evenement = nom_evenement;
      this.description = description;
      this.date_evenement = date_evenement;
      this.id_organisateur = id_organisateur;
    }
  }
  module.exports = Event;