import db from "../models";
export const get_search= (req, res) => {
    db.sequelize
      .query(
        `CALL search(%${req.query.search}%) `,
      )
      .then((results) => res.json({ success: true, results: results[0] }))
      .catch((err) => {
        console.log(err);
        res.status(500).json({ err });
      });
  };

//   export const get_TO= (req, res) => {
//     db.sequelize
//       .query(
//         `CALL search(:search_term) `, {
//             replacements:{
//                 search_term:req.query.search
//             }
//         },
//       )
//       .then((results) => res.json({ success: true, results: results[0] }))
//       .catch((err) => {
//         console.log(err);
//         res.status(500).json({ err });
//       });
//   };