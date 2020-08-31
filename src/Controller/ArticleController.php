<?php

namespace App\Controller;


use App\Entity\Article;
use App\Form\ArticleType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="article")
     */
    public function index()
    {
        $articles = $this->getDoctrine()->getRepository(Article::class)->findAll();
        return $this->render('article/index.html.twig', [
            'articles' => $articles,
        ]);
    }

    /**
     * @Route("/article/add", name="add_article")
     */

    public function add(Request $request, SluggerInterface $slugger)
    {
        $form = $this->createForm(ArticleType::class, new Article());
// Ici nous traitons notre requête
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $article = $form->getData();
            $imageFile = $form->get('image')->getData();
            if ($imageFile) {
                $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();
                try {
                    $imageFile->move(
                        $this->getParameter('images_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {

                }

                $article->setImage($newFilename);

            }
            $em = $this->getDoctrine()->getManager();
            $em->persist($article);
            $em->flush();
            return $this->redirectToRoute('article');
        }
        else {
            return $this->render('article/article_add.html.twig', [
                'form' => $form->createView(),
                'errors'=>$form->getErrors()
            ]);
        }
    }



    /**
     * @Route("/article/{id}", name="detail")
     */
    public function getOne($id){
        $article = $this->getDoctrine()->getRepository(Article::class)->find($id);

        return $this->render('article/detail.html.twig', [
            'article' => $article,
        ]);
    }




    /**
     * @Route("/article/delete/{id}", name="article_delete")
     */
    public function delete($id)
    {
        $article = $this->getDoctrine()->getRepository(Article::class)->find($id);
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($article);
        $entityManager->flush();
        return $this->redirectToRoute('article');

    }

}
