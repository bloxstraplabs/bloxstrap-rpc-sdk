declare namespace BloxstrapRPC {
	export interface RichPresenceImage {
		assetId?: number;
		hoverText?: string;
		clear?: boolean;
		reset?: boolean;
	}

	export interface RichPresence {
		details?: string;
		state?: string;
		timeStart?: number;
		timeEnd?: number;
		smallImage?: RichPresenceImage;
		largeImage?: RichPresenceImage;
	}
}

declare interface BloxstrapRPC {
	SendMessage: (command: string, data: any) => void;
	SetRichPresence: (data: BloxstrapRPC.RichPresence) => void;
	SetLaunchData: (data: string) => void;
}

declare const BloxstrapRPC: BloxstrapRPC;
export = BloxstrapRPC;
