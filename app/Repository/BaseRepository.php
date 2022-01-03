<?php

namespace App\Repository;

use App\Interfaces\IBase.php;
use Illuminate\Database\Eloquent\Model;

class BaseRepository implements IBase
{
  protected $model;
  public function __construct(Model $model)
  {
    $this->model = $model;
  }

    /**
   * Function update element from Database
   * @param $id
   * @return bool
   */

  public function update(array $attributes,  string $id): bool
  {
    return $this->model->update($attributes);
  }

  public function findAll(string $id): object
  {
    return $this->model->get();
  }
}