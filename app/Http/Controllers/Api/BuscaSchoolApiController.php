<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Models\Alerta;
use App\Models\Models\Pesquisa;
use Illuminate\Http\Request;
use App\Models\Models\School;
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

        if ($school != null) {

            $children = DB::table('children')
                ->join('case_steps_pesquisa', 'children.id', '=', 'case_steps_pesquisa.child_id')
                ->join('schools', 'case_steps_pesquisa.school_last_id', '=', 'schools.id')
                ->join('case_steps_alerta', 'children.id', '=', 'case_steps_alerta.child_id')
                ->select(['case_steps_alerta.id', 'case_steps_alerta.name', 'case_steps_alerta.mother_name', 'case_steps_alerta.place_address', 'case_steps_pesquisa.place_address', 'case_steps_alerta.place_cep', 'case_steps_alerta.place_reference', 'case_steps_alerta.place_neighborhood', 'children.educacenso_year', 'case_steps_pesquisa.school_last_name'])

                ->where('schools.id', '=', $idescola)
                ->where(function ($query) {
                    $query->where('case_steps_alerta.place_address', '=', '')
                        ->orWhere('case_steps_alerta.place_address', '=', null)
                        ->orWhere('case_steps_alerta.place_cep', '=', '')
                        ->orWhere('case_steps_alerta.place_cep', '=', null)
                        ->orWhere('case_steps_alerta.place_reference', '=', '')
                        ->orWhere('case_steps_alerta.place_reference', '=', null)
                        ->orWhere('case_steps_alerta.place_neighborhood', '=', '')
                        ->orWhere('case_steps_alerta.place_neighborhood', '=', null);

                })
                ->get()->all();



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

    public function saveAlert(Request $request, $alert_id)
    {

        //1 - Localizar alerta com base no id do alerta.
        $alerta = Alerta::where(
            'id',
            '=',
            $alert_id
        )
            ->get()->first();

        if ($alerta != null) {

            $pesquisa = Pesquisa::where(
                'child_id',
                '=', $alerta->child_id
            )
                ->get()->first();

            //2- Instanciar os campos a serem atualizados
            $place_address = $request->get("place_address");
            $place_cep = $request->get("place_cep");
            $place_reference = $request->get("place_reference");
            $place_neighborhood = $request->get("place_neighborhood");

            //3 - Atualizar os campos instanciados no passo 2.
            $alerta->place_address = $place_address;
            $alerta->place_cep = $place_cep;
            $alerta->place_reference = $place_reference;
            $alerta->place_neighborhood = $place_neighborhood;

            $pesquisa->place_address = $place_address;
            $pesquisa->place_cep = $place_cep;
            $pesquisa->place_reference = $place_reference;
            $pesquisa->place_neighborhood = $place_neighborhood;

            $pesquisa->save(); //4 - update
            $alerta->save(); //4 - update

            $alerta = [ //5 -Retorna o corpo do jason esperado no front
                "status" => "SUCCESS",
                "message" => "Alerta atualizado",
                "data" => $alerta //data chama o alerta atualizado
            ];

            return response()->json($alerta);

        } else { //Em caso do front enviar um id incorreto, o else retorna ERROR
            $alerta = [
                "status" => "ERROR",
                "message" => "Alerta não localizada",
                "data" => null,
            ];
            return response()->json($alerta);
        }
    }
}