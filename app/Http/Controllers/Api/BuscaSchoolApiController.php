<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Models\Child;
use App\Models\Models\Pesquisa;
use App\Models\Models\School;
use Facade\Ignition\DumpRecorder\Dump;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\Expr\Cast\String_;
use Symfony\Component\VarDumper\VarDumper;

class BuscaSchoolApiController extends Controller
{
  
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function returnChildren(Request $request)
    {
        $idescola = $request->input('school_last_id');
        $token = $request->input('token');
        $idescola = intval($idescola);

        $school = School::where([
            ['token', '=', $token],
            ['id', '=', $idescola]
        ])->get()->first();

        if( $school != null ){

            $children = DB::table('children')
            ->join('case_steps_pesquisa','children.id', '=', 'case_steps_pesquisa.child_id')
            ->join('schools', 'case_steps_pesquisa.school_last_name', '=', 'schools.name')
            ->select(['schools.id','schools.token','children.id', 'children.name','children.mother_name', 'case_steps_pesquisa.place_address','case_steps_pesquisa.place_cep','case_steps_pesquisa.place_reference','case_steps_pesquisa.place_neighborhood','children.educacenso_year','case_steps_pesquisa.school_last_name'])
            ->where([
                ['schools.id', '=', $idescola]
            ])->get()->all();
        
            $final = [
                "status" => "SUCCESS",
                "message" => "Loaded alertas",
                "data" => $children,
                "school" => $school
            ];

            return response()->json($final);

        } else {

            $final = [
                "status" => "ERROR",
                "message" => "Escola não localizada",
                "data" => null,
                "school" => null
            ];

            return response()->json($final);

        }

    }

    






}
