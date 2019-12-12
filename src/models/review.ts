const db = require("../db");

type ReviewModel {
  user_id: string,
  review_list: number,
  reviewee: string,
  review: string
}

export class Review {
  static async create({ user_id, review_list, reviewee, review }: Partial<ReviewModel>) {
    const result = await db.query(
      `INSERT INTO reviews (
        user_id,
        review_list,
        reviewee,
        review)
        VALUES ($1, $2, $3, $4)`,
      [user_id, review_list, reviewee, review]
    );
    return result;
  }

  static async getAllForUser({user_id}: Partial<ReviewModel>) {
    const result = await db.query(
      `SELECT * 
      FROM reviews
      WHERE reviewer=$1`,
      [user_id]
    )
    return result;
  }
}