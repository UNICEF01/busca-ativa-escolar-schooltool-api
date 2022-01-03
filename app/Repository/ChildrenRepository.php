<?php

namespace App\Repository;

use App\Repository\BaseRepository;
use App\Models\Models\Child;

class ChildrenRepository extends BaseRepository
{

    protected $child;

    public function __contruct(Child $child)
    {
        parent::__contruct($child);
    }

    public function findAll(string $id): object
    {
        return Child::select(['case_steps_alerta.id',
                              'case_steps_alerta.name',
                              'case_steps_alerta.mother_name',
                              'case_steps_alerta.place_address',
                              'case_steps_pesquisa.place_address',
                              'case_steps_alerta.place_cep',
                              'case_steps_alerta.place_reference',
                              'case_steps_alerta.place_neighborhood',
                              'children.educacenso_year',
                              'case_steps_pesquisa.school_last_name'])
        ->join('case_steps_pesquisa','children.id', '=', 'case_steps_pesquisa.child_id')
        ->join('schools', 'case_steps_pesquisa.school_last_id', '=', 'schools.id')
        ->join('case_steps_alerta','children.id','=', 'case_steps_alerta.child_id')
        ->where('schools.id', '=', $id)
        ->where(function($query) {
            $query->where('case_steps_alerta.place_address','=', '')
                  ->orWhere('case_steps_alerta.place_address', '=', null)
                  ->orWhere('case_steps_alerta.place_cep', '=', '')
                  ->orWhere('case_steps_alerta.place_cep', '=', null)
                  ->orWhere('case_steps_alerta.place_reference', '=', '')
                  ->orWhere('case_steps_alerta.place_reference', '=', null)
                  ->orWhere('case_steps_alerta.place_neighborhood', '=', '')
                  ->orWhere('case_steps_alerta.place_neighborhood', '=', null);

        })
        ->get();
    }


}