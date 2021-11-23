<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Models\Pesquisa;

class BuscaSchoolApiController extends Controller
{
    public function __construct(Pesquisa $aluno, Request $request)
    {
        $this->aluno = $aluno;
        $this->request = $request;
    }
    public function index()
    {
        $data = $this->aluno->all();
        return response()->json($data);
    }
}
