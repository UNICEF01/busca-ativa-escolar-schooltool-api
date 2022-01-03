<?php

namespace App\Repository;

use App\Models\Models\Pesquisa;
use Illuminate\Database\Eloquent\Model;

class ResearchRepository extends BaseRepository
{
    protected $research;

    public function __construct(Pesquisa $research){
        parent::__construct($research);
    }

    public function update(array $attributes, string $id): bool
    {
        $researchData = $this->model->where('child_id', $id)->first();
        $researchData->place_address = $attributes['place_address'];
        $researchData->place_cep = $attributes['place_cep'];
        $researchData->place_reference = $attributes['place_reference'];
        $researchData->place_neighborhood = $attributes['place_neighborhood'];
        return $researchData->update();
    }
}