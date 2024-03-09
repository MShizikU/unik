const db = require("../models");
const Agr = db.agr;

exports.updateAgr = async (req, res) => {
  const agrId = parseInt(req.params.id, 10);
  const updatedData = req.body;

  try {
    //const agrs = await Agr.findAll();
    //console.log(agrs);
    //console.log(agrId);
    const [updatedRowsCount, updatedAgrs] = await Agr.update(updatedData, {
      where: { id: agrId },
      returning: true,
    });

    if (updatedRowsCount > 0) {
      res.status(200).json(updatedAgrs[0]);
    } else {
      res.status(404).json({ message: 'Agr not found' });
    }
  } catch (error) {
    console.error('Error updating agr:', error);
    res.status(500).json({ message: 'Error updating agr', error: error.message });
  }
};

exports.createAgr = async (req, res) => {
  const newData = req.body;

  try {
    const createdAgr = await Agr.create(newData);

    res.status(201).json(createdAgr);
  } catch (error) {
    console.error('Error creating agr:', error);
    res.status(500).json({ message: 'Error creating agr', error: error.message });
  }
};

exports.deleteAgr = async (req, res) => {
  const agrId = parseInt(req.params.id, 10);

  try {
    const deletedRowCount = await Agr.destroy({
      where: { id: agrId },
    });

    if (deletedRowCount > 0) {
      res.status(200).json({ message: 'Agr deleted successfully' });
    } else {
      res.status(404).json({ message: 'Agr not found' });
    }
  } catch (error) {
    console.error('Error deleting agr:', error);
    res.status(500).json({ message: 'Error deleting agr', error: error.message });
  }
};