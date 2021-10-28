<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Models\Child;
use App\Models\Models\Pesquisa;
use Illuminate\Support\Facades\DB;

class BuscaSchoolApiController extends Controller
{
  
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function index()
    {
        
       $children = DB::table('children')
        ->join('case_steps_pesquisa','children.id', '=', 'case_steps_pesquisa.child_id')
        ->join('schools', 'case_steps_pesquisa.school_last_name', '=', 'schools.name')
        ->select('children.id', 'children.name','children.mother_name', 'case_steps_pesquisa.place_address','case_steps_pesquisa.place_cep','case_steps_pesquisa.place_reference','case_steps_pesquisa.place_neighborhood','children.educacenso_year','case_steps_pesquisa.school_last_name')
        ->where([
            ['schools.id', '=', 33032211]
          
        ])
       ->get();
       
        //$children = DB::table('children')
        //                ->select('id', 'name', 'mother_name')
        //                ->get();


        //retornando por mais de uma opçao
        // $data = Child::where([
        //     ['age', '=', 16],
        //     ['child_status', '=', 'cancelled']
        // ])->get()->all();

        //fazendo contas
        //$data = Child::count();

        //retornando quantidade por mais de uma opçao
        // $data = Child::where([
        //     ['age', '=', 16],
        //     ['child_status', '=', 'cancelled']
        // ])->count();

        //retornando por mais de uma opçao
        // $data = Child::where([
        //     ['risk_level', '=', 'medium'],
        //     ['age', '>', 10],
        //     ['age', '<', 15],
        //     ['gender', '=', 'female']
        // ])
        // ->with(['pesquisa'])
        // ->get()
        // ->all();

        return response()->json($children);
    }

}
