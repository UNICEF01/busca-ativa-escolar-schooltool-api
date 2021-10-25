<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Models\Aluno;

class BuscaSchoolApiController extends Controller
{
    public function __construct(Aluno $aluno, Request $request)
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
