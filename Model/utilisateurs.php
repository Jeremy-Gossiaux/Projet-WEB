<?php
/**
 * Created by PhpStorm.
 * User: theba
 * Date: 08/06/18
 * Time: 18:07
 */

class utilisateurs
{
    protected $_utilisateur;
    private $_code;
    private $_nom;
    private $_prenom;
    private $_admin;
    private $_actif;
    protected $_pattern = "#^[a-z0-9]+$#i";
    protected $_number = "/[^0-9]/";

    public function getUtilisateur()
    {
        return $this->_utilisateur;
    }
    public function setUtilisateur($utilisateur)
    {
        $this->_utilisateur=$utilisateur;
    }

    if(preg_match($_pattern , $_utilisateur))
    {
        echo "Le nom d'utilisateur est bien valide !";
    }
    else
    {
        echo "Le nom d'utilisateur contient des caractères spéciaux et ne peut être accepté";
    }

//-------------------------------------------------------------------

    public function getCode()
    {
        return $this->_code;
    }
    public function setCode($code)
    {
        $this->_code=$code;
    }

    // Pas de test possible

    //---------------------------

    public function getNom()
    {
        return $this->_nom;
    }
    public function setNom($nom)
    {
        $this->_nom=$nom;
    }

    if(preg_match($_pattern , $_nom))
    {
        echo "Le nom est bien valide !";
    }
    else
    {
        echo "Le nom contient des caractères spéciaux et ne peut être accepté";
    }

    if(preg_match($_number, $_nom))
    {
        echo "Le nom est valide";
    }
    else
    {
        echo "Le nom contient des chiffres et ne peut être accepté";
    }


    //-----------------------------------


    public function getPrenom()
    {
        return $this->_prenom;
    }

    public function setPrenom($prenom)
    {
        $this->_prenom=$prenom;
    }

    if(preg_match($_pattern , $_prenom))
    {
        echo "Le prenom est bien valide !";
    }
    else
    {
        echo "Le prenom contient des caractères spéciaux et ne peut être accepté";
    }

    if(preg_match($_number, $_prenom))
    {
        echo "Le prenom est valide";
    }
    else
    {
        echo "Le prenom contient des chiffres et ne peut être accepté";
    }

    //---------------------------------------

    public function getAdmin()
    {
        return $this->_admin;
    }

    public function setAdmin($admin)
    {
        $this->_admin=$admin;
    }


    //-----------------------------------------------

    public function getActif()
    {
        return $this->_admin;
    }

    public function setActif($actif)
    {
        $this->_actif=$actif;
    }

    //----------------------------------------------------
}