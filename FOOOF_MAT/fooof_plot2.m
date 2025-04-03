%% Camille Rakotoranto, April 2025, MATLAB R2024b, The MathWorks Inc., Natick, MA, USA
%% This script was added to Donoghue et al. (2020)'s implementation of FOOOF to MATLAB 
% to plot two FOOOF-adjusted PSDs on one figure.

function fooof_plot2(fooof_results_ec, fooof_results_eo, log_freqs)

    %% Data Checking

    if ~isfield(fooof_results_ec, 'freqs') || ~isfield(fooof_results_eo, 'freqs')
       error('FOOOF results struct does not contain model output for EC or EO.')
    end

    %% Set Up

    % If logarithmic frequency is requested, apply log transformation
    if exist('log_freqs', 'var') && log_freqs
        plt_freqs_ec = log10(fooof_results_ec.freqs);
        plt_freqs_eo = log10(fooof_results_eo.freqs);
    else
        plt_freqs_ec = fooof_results_ec.freqs;
        plt_freqs_eo = fooof_results_eo.freqs;
    end

    % Plot settings
    lw = 2.5;

    %% Create the plots

    figure()
    hold on

    % Plot the pre-FOOOF data for EC and EO conditions
    plot(plt_freqs_ec, fooof_results_ec.power_spectrum, 'black', 'LineWidth', lw, 'DisplayName', 'T7 PSD (Eyes Closed)');
    plot(plt_freqs_eo, fooof_results_eo.power_spectrum, 'green', 'LineWidth', lw, 'DisplayName', 'T7 PSD (Eyes Open)');

    % Plot the post-FOOOF model fit for EC and EO conditions
    plot(plt_freqs_ec, fooof_results_ec.fooofed_spectrum, 'red', 'LineWidth', lw, 'DisplayName', 'Full Model Fit (EC)');
    plot(plt_freqs_eo, fooof_results_eo.fooofed_spectrum, 'blue', 'LineWidth', lw, 'DisplayName', 'Full Model Fit (EO)');

    % Plot the aperiodic fit for EC and EO conditions
    plot(plt_freqs_ec, fooof_results_ec.ap_fit, 'b--', 'LineWidth', lw, 'DisplayName', 'Aperiodic Fit (EC)');
    plot(plt_freqs_eo, fooof_results_eo.ap_fit, 'c--', 'LineWidth', lw, 'DisplayName', 'Aperiodic Fit (EO)');

    %% Plot Settings

    % Apply general plot settings
    grid on
    legend('show');
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density (dB)');
    title('FOOOF Results for T7: Eyes Closed vs. Eyes Open');
    
    hold off

end
