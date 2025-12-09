@extends('layouts.app')

@section('content')
    <section class="auth-container">
        @component('components.auth-form', ['type' => 'register'])
        @endcomponent
    </section>
@endsection
