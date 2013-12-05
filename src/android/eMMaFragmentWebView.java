// Add your package and imports

public class eMMaFragmentWebView extends Fragment {
	String url;
	View view;
	
	static eMMaFragmentWebView newInstance(String url) {
		eMMaFragmentWebView f = new eMMaFragmentWebView();
		Bundle args = new Bundle();
		args.putString("url", url);
		f.setArguments(args);
		return f;
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (getArguments() != null) {
			url = getArguments().getString("url");
		}
		else {
			Log.e("eMMa", "No URL defined.");
		}
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		view = eMMaWebView.inflate(view, getActivity(), url); 
		return view;
	}
	
	@Override
	public void onSaveInstanceState(Bundle outState) {
	    outState.putString("url", url);
	    super.onSaveInstanceState(outState);
	}
}
