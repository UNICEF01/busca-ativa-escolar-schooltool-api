<?php

namespace App\Repository;

use App\Models\Models\Alerta;
use Illuminate\Database\Eloquent\Model;

class AlertRepository extends BaseRepository
{
    protected $alert;

    public function __construct(Alert $alert){
        parent::__construct($alert);
    }

    public function update(array $attributes, string $id): bool
    {
  
      $alertData = $this->model->where('id', $id)->first();
      $alertData->place_address = $attributes['place_address'];
      $alertData->place_cep = $attributes['place_cep'];
      $alertData->place_reference = $attributes['place_reference'];
      $alertData->place_neighborhood = $attributes['place_neighborhood'];
      return $alertData->update();
    }
}