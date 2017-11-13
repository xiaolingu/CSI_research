%Write by Joey
%aoa_packet_data:ÿ�����ݰ���aoa������ÿ�����ݰ���musicƵ�׵õ��Ĳ����Ӧ��aoa
%tof_packet_data:ÿ�����ݰ���tof������ÿ�����ݰ���musicƵ�׵õ��Ĳ����Ӧ��tof
%output_top_aoaos:ǰ5�����п�����ֱ��·����AOA
function [Pmusics, eigenvalue] = run_spotfi(filepath)
    antenna_distance = 0.0261;  % ���߾���
    frequency = 5.745 * 10^9;  % Ƶ��
    sub_freq_delta = (40 * 10^6) /30;  % ���ز����
	
    csi_trace = readfile(filepath);
    num_packets = floor(length(csi_trace)/1);
	
    sampled_csi_trace = csi_sampling(csi_trace, num_packets, 1, length(csi_trace));
	
    [Pmusics, eigenvalue] = spotfi(sampled_csi_trace,frequency, sub_freq_delta, antenna_distance);
	
	
	plot_result(Pmusics);	
end

%Ϊʲô���в�����
%tau = result(1);���������������ģ�
% ��������������°벿��
% ����ӵ��p��AOA��ֵ����ô estimated_aoas �� p * 1
% estimated_tofs �� p * length(tau) �ľ���