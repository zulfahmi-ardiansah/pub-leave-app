@if ($application->delegations)
    <div class="card mb-3">
        <div class="card-header">
            <h4 class="card-title">
                Data Delegasi Pekerjaan
            </h4>
        </div>
        <div class="card-body">
            @foreach ($application->delegations as $applicationDelegationIndex => $applicationDelegation)
                <table class="table table-bordered table-hover table-vcenter table-special mb-0 mt-{{ $applicationDelegationIndex == 0 ? '0' : '3' }}">
                    <thead>
                        <tr>
                            <th>
                                Informasi Proyek # {{ $applicationDelegationIndex + 1 }}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <b class="mt-2 d-flex" style="align-items: center">
                                    <span style="width: 7.5px; height: 7.5px; background-color: {{ $applicationDelegation->project->weight->flag }}; margin-right: 10px;" class="d-inline-block"></span> {{ $applicationDelegation->project->name }}
                                </b>
                                <div>
                                    <small>
                                        {{ $applicationDelegation->project->description }}
                                    </small>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-4 mb-2">
                                        <div>
                                            <small>
                                                <b>Bobot</b>
                                            </small>
                                        </div>
                                        @if ($applicationDelegation->project->weight_id)
                                            ({{ $applicationDelegation->project->weight->classification }}) {{ $applicationDelegation->project->weight->name }}
                                        @endif
                                    </div>
                                    <div class="col-md-4 mb-2">
                                        <div>
                                            <small>
                                                <b>Manajer</b>
                                            </small>
                                        </div>
                                        {{ $applicationDelegation->project->manager_id ? $applicationDelegation->project->manager->name : '-' }}
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                    <thead>
                        <tr>
                            <th>
                                Delegasi Proyek # {{ $applicationDelegationIndex + 1 }}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                @if (!($application->current_delegation_id))
                                    <div class="form-group mb-3">
                                        <label class="form-label">
                                            Karyawan Delegasi
                                        </label>
                                        <p class="form-control mb-0">
                                            {{ $applicationDelegation->delegation->name }} ({{ $applicationDelegation->delegation->position }}) {{ $applicationDelegation->delegation->division_id ? '- ' . $applicationDelegation->delegation->division->name : '' }}
                                        </p>
                                    </div>
                                @endif
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Posisi Yang Didelegasikan
                                    </label>
                                    <p class="form-control mb-0">
                                        {{ $applicationDelegation->position }}
                                    </p>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Lingkup Pekerjaan Yang Didelegasikan
                                    </label>
                                    <p class="form-control mb-0">
                                        {{ $applicationDelegation->scope }}
                                    </p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            @endforeach
        </div>
    </div>
@endif