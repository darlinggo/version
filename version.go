package version

import "net/http"

var (
	// Hash is the VCS hash the binary was built from.
	Hash string
	// Tag is the VCS tag the binary was built from.
	Tag string
	// Branch is the VCS branch the binary was built from.
	Branch string
	// Timestamp is the time the binary was built.
	Timestamp string

	// Handler is an http.Handler that exposes the versioning
	// information as an endpoint.
	Handler = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("VERSION_HASH=\"" + Hash + "\"\nVERSION_TAG=\"" + Tag + "\"\nVERSION_BRANCH=\"" + Branch + "\"\nVERSION_TIME=\"" + Timestamp + "\""))
	})
)
