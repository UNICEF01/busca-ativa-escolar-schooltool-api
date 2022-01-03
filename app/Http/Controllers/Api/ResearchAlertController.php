<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\IAlertResearch;
use Exception;

class ResearchAlertController extends Controller
{
    protected $researchAlertService;

    public function __construct(IAlertResearch $researchAlertService)
    {
        $this->researchAlertService = $researchAlertService;
    }

    public function update(Request $request)
    {
        $data = $request->only([
            'alert_id',
            'place_address',
            'place_cep',
            'place_reference',
            'place_neighborhood'
        ]);    
        
        $result = ['status' => 200];

        try{
            $result = [
                'message' => 'Alert is updated',
                'data' => $this->researchAlertService->updateAlertResearch($data);
            ]
        }catch(Exception $e){
            $result = [
                'status' => 500,
                'error' => 'Alert not found'
            ];
        }
        return response()->json($result, $result['status']);
    }
}
