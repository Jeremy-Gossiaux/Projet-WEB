<?php
/**
 * Created by PhpStorm.
 * User: Axel
 * Date: 08/06/18
 * Time: 18:17
 */

class ventes
{

    protected $_idvente;
    private $_datevente;
    private $_etat;
    private $_utilisateurs_utilisateur;

    public function getIdVentes()
    {
        return $this->_idvente;
    }

    //----------------------------------------

    public function getDateVente()
    {
        return $this->_datevente;
    }
    public function setDateVente($datevente)
    {
        $this->_datevente=$datevente;
    }

    

    //-----------------------------------------

    public function getEtat()
    {
        return $this->_etat;
    }
    public function setEtat($etat)
    {
        $this->_etat=$etat;
    }

    //-----------------------------------------

    public function getUtilisateurs_utilisateur()
    {
        return $this->_utilisateurs_utilisateur;
    }
    public function setUtilisateurs_utilisateur($utilisateurs_utilisateur)
    {
        $this->_utilisateurs_utilisateur=$utilisateurs_utilisateur;
    }

    //-----------------------------------------
}