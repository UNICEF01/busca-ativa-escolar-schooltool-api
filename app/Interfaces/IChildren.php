<?php

namespace App\Interfaces;

use Illuminate\Database\Eloquent\Model;

interface IChildren
{
  public function getAll(string $id): object;
}