<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ChildrenController extends Controller
{
    protected $childrenService;

    public function __construct(IChildren $childrenService)
    {
        $this->childrenService = $childrenService;
    }

    public function findChildrens(Request $request)
    {
        $data = $request->only([
            'school_last_id',
            'token'
        ]);    
        
        $result = ['status' => 200];

        try{
            $dataChildren = $this->childrenService->getAll($data);
            $result = [
                "message" => "Loaded alertas",
                "data" => $dataChildren[0],
                "school" => $dataChildren[1]
            ]
        }catch(Exception $e){
            $result = [
                'status' => 500,
                "message" => "Escola não localizada",
                "data" => null,
                "school" => null
            ];
        }
        return response()->json($result, $result['status']);
    }
}
