import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    publishedAt: z.coerce.date(),
    updatedAt: z.coerce.date().optional(),
    keywords: z.array(z.string()),
    status: z.enum(['draft', 'review', 'published']),
    cta: z.enum(['sample', 'product']),
  }),
});

export const collections = { blog };
