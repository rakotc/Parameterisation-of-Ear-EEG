%% April 2025, MATLAB R2024b, The MathWorks Inc., Natick, MA, USA
%% This was directly taken from https://github.com/fooof-tools/fooof_mat.

% fooof_plot() - Plot a FOOOF model.
%
% Usage:
%   >> fooof_plot(fooof_results)
%
% Inputs:
%   fooof_results   = struct of fooof results
%                       Note: must contain FOOOF model, not just results
%   log_freqs       = boolean, whether to log frequency axis
%                       Note: this argument is optional, defaults to false
%

function fooof_plot(fooof_results, log_freqs)

    %% Data Checking

    if ~isfield(fooof_results, 'freqs')
       error('FOOOF results struct does not contain model output.')
    end

    %% Set Up

    if exist('log_freqs', 'var') && log_freqs
        plt_freqs = log10(fooof_results.freqs);
    else
        plt_freqs = fooof_results.freqs;
    end

    % Plot settings
    lw = 2.5;

    %% Create the plots

    figure()
    hold on

    % Plot the original data
    data = plot(plt_freqs, fooof_results.power_spectrum, 'black');

    % Plot the full model fit
    model = plot(plt_freqs, fooof_results.fooofed_spectrum, 'red');

    % Plot the aperiodic fit
    ap_fit = plot(plt_freqs, fooof_results.ap_fit, 'b--');

    %% Plot Settings

    % Apply general plot settings
    for plt = [data, model, ap_fit]
        set(plt, 'LineWidth', lw);

    % Set alpha value for model - in a wonky way, because Matlab
    %   Note: the '4' is magical and mysterious. No idea.
    model.Color(4) = 0.5;

    grid on
    legend('Original Spectrum', 'Full Model Fit', 'Aperiodic Fit')

    hold off

end
