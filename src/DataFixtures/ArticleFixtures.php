<?php

namespace App\DataFixtures;

use App\Entity\Article;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ArticleFixtures extends Fixture
{
    private $encoder;
    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }
    public function load(ObjectManager $manager)
    {
        $article = new Article();
        $article->setTitre('Ouches : en direct des cuisines de la maison Troisgros');
        $article->setImage('troisgros.jpg');
        $article->setDescription('Il y a un an, jour pour jour, la famille Troisgros accueillait ses clients dans son nouveau lieu à Ouches. Michel Troisgros dresse le bilan d’une année « exceptionnelle », alors que s’ouvre celle des 50 ans de 3 étoiles Michelin.
Rencontre avec Michel Troisgros qui revient sur cette année riche en émotions et découvrez l’ambiance en cuisine à l’heure du service .');
        $manager->persist($article);
        $manager->flush();

        $article = new Article();
        $article->setTitre('Saint-Étienne est la capitale du design');
        $article->setImage('design.jpg');
        $article->setDescription('Saint-Étienne est la seule ville française désignée Ville créative pour le design par l\'Unesco. Elle est aussi labellisée French Tech / Design Tech. Saint-Étienne a été la capitale industrielle de l\'Europe au XIXe siècle. Dans notre ville sont nées des inventions qui ont marqué leur époque. Le monde n\'a plus jamais été comme avant après l\'invention de la première ligne de chemin de fer à Saint-Étienne');
        $manager->persist($article);
        $manager->flush();

    }
}
