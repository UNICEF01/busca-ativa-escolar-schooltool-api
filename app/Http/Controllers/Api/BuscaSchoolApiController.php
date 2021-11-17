<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Models\Child;
use App\Models\Models\Alerta;
use Illuminate\Http\Request;
use App\Models\Models\School;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\DB;

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
            ->join('case_steps_alerta','children.id','=', 'case_steps_alerta.child_id')
            ->select(['case_steps_alerta.id','case_steps_alerta.name','case_steps_alerta.mother_name','case_steps_pesquisa.place_address','case_steps_alerta.place_cep','case_steps_pesquisa.place_reference','case_steps_pesquisa.place_neighborhood','children.educacenso_year','case_steps_pesquisa.school_last_name'])
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

    public function saveAlert(Request $request, $alert_id){
        
         //1 - localizar alerta com base no id do alerta.
        $alerta = Alerta::where(
            'id', '=', $alert_id
        )->get()->first();
        if( $alerta != null ){
            
            $place_address = $request->get("place_address");
            $place_cep = $request->get("place_cep");
            $place_reference = $request->get("place_reference");
            $place_neighborhood = $request->get("place_neighborhood");
    
            //3 - Atualizar os campos do alerta.
             $alerta->place_address = $place_address;
             $alerta->place_cep = $place_cep;
             $alerta->place_reference = $place_reference;
             $alerta->place_neighborhood = $place_neighborhood;
    
            //4 - update
             $alerta->save();
    
             return response()->json($alerta);
            

            $final = [
                "status" => "SUCCESS",
                "message" => "Loaded alertas",
                "data" => $alerta
            ];

            return response()->json($final);

        } else {

            $final = [
                "status" => "ERROR",
                "message" => "Escola não localizada",
                "data" =>"Alerta não localizada",
            ];

            return response()->json($final);
               
        }

        //2 - Instanciar variáveis
        //Pegar valor por meio de json return $request->get("place_neighborhood");

       
  
    }

    

}