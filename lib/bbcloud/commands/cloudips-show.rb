desc 'show details on Cloud IPs'
arg_name 'cloudip-id...'
command [:show] do |c|

  c.action do |global_options,options,args|

    if args.empty?
      raise "You must specify the cloud ips you want to show"
    end

    ips = CloudIP.find_or_call(args) do |id|
      warn "Couldn't find cloud ip #{id}"
    end

    fields = [:id, :status, :public_ip, :reverse_dns, :destination, :interface_id]

    render_table(ips.compact, global_options.merge({ :vertical => true, :fields => fields}))                                              
  end
end
