<?php

namespace App\Interfaces;

use Illuminate\Database\Eloquent\Model;

interface IBase
{
  public function findAll(string $id): object;
  public function update(array $attributes, string $id): bool;
}