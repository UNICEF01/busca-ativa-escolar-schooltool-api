<?php

namespace App\Services;
use App\Interfaces\IAlertResearch;
use App\Repository\AlertRepository;
use App\Repository\ResearchRepository;
use Illuminate\Support\Facades\Validator;
use InvalidArgumentException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ResearchAlertService implements IAlertResearch
{
    protected $alertRepository;
    protected $researchRepository;

    public function __contruct(AlertRepository $alertRepository, ResearchRepository $researchRepository)
    {
        $this->alertRepository = $alertRepository;
        $this->researchRepository = $researchRepository;
    }

    public function updateAlertResearch(array $attributes): object
    {
        $validator = Validator::make($attributes, [
            'alert_id' => 'required',
            'place_address' => 'string|max:255|nullable',
            'place_cep' => 'string|max:255|nullable',
            'place_reference' => 'string|max:255|nullable',
            'place_neighborhood' => 'string|max:255|nullable',
        ])

        if ($validator->fails()) {
            throw new InvalidArgumentException($validator->errors()->first());
        }

        DB::beginTransaction();

        try {
            
            $alerta = Alerta::where('id', $attributes['alert_id'])->get()->first();
            
            if($alerta){
                $research = $this->researchRepository->update($attributes, $alerta->child_id);
                $alert = $this->alertRepository->update($attributes, $attributes['alert_id']);
            }

        } catch (Exception $e) {
            DB::rollBack();
            Log::info($e->getMessage());

            throw new InvalidArgumentException('Unable to update alert/research data');
        }

        DB::commit();

        return $alert;
    }

}