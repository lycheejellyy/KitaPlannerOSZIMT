import { Router } from 'express';
import { getCards } from '../controllers/childController';
const router = Router();

router.get('/', getCards);

export default router;
