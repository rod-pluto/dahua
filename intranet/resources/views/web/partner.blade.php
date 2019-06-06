@extends('layouts.web')

@section('content')

<div class="jumbotron jumbotron-fluid" style="height:140px ;background-color: #0c59a6; color:white">
    <div class="container" style="margin-top: -20px;">
        <span>Home</span>
        <h3>QUERO SER UM PARCEIRO</h3>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-8 col-lg-8">

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form class="form-row" action="{{ route('web.partner.store') }}" method="POST">
                @csrf

                <div class="form-group col-md-12">
                    <label for="looking_for">O que você procura ?</label>
                    <input id="looking_for" class="form-control" name="looking_for" value="{{ old('looking_for') }}">
                </div>

                <div class="form-group col-md-6">
                    <label for="name">Nome completo</label>
                    <input id="name" class="form-control" name="name" value="{{ old('name') }}">
                </div>
                <div class="form-group col-md-6">
                    <label for="cellphone">Celular</label>
                    <input id="cellphone" class="form-control" name="cellphone" value="{{ old('cellphone') }}">
                </div>

                <div class="form-group col-md-6">
                    <label for="company">Empresa</label>
                    <input id="company" class="form-control" name="company" value="{{ old('company') }}">
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input id="email" class="form-control" name="email" value="{{ old('email') }}">
                </div>

                <div class="form-group col-md-12">
                    <label for="message">Mensagem</label>
                    <textarea id="message" class="form-control" name="message">{{ old('message') }}</textarea>
                </div>

                <div class="">
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </form>
        </div>
    </div>
</div>
@stop
